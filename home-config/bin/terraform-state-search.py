#!/usr/bin/env python

"""
Command-line tool to search ```$ terraform state pull``` json input 
(piped from stdin) resources for specific keys, group them by parent
resource objects, and print the output in Github formatted markdown.

Usage:
  $ chmod +x terraform-state-search.py
  $ terraform state pull | terraform-state-search.py attr1 attr2 attr3
"""

import sys
import json
import re
import argparse
from argparse import RawTextHelpFormatter

def stdin_to_json():
  """Compiles piped stdin into a json object"""
  return json.load(sys.stdin)

def search_resources(t_state, found_items=[], attr_keys=[]):
  """Returns a list of all resource objects in a Terraform state pull JSON,
  optionally filtered by attributes in attr_keys[] kwarg
  """

  if isinstance(t_state, dict):
    if "resources" in t_state:
      for key, value in t_state["resources"].iteritems():
        item = {}
        item["item"] = key
        item["type"] = value["type"]
        if attr_keys:
          filtered_attrs = {attr:value for attr,value 
                            in value["primary"]["attributes"].iteritems()
                            if attr in attr_keys}
          item["attributes"] = filtered_attrs
        else:
          item["attributes"] = value["primary"]["attributes"]
        found_items.append(item)
    else:
      for key, value in t_state.iteritems():
        if isinstance(value, (dict, list)):
          search_resources(value, found_items, attr_keys)
  elif isinstance(t_state, list):
    for item in t_state:
      search_resources(item, found_items, attr_keys)

  return found_items

def groupby_type(resources):
  """Groups terraform resources by type in order of arg keys"""
  groups = {}
  types = set([item["type"] for item in resources])
  for t in types:
    grouped_items = [item for item in resources if item["type"] == t]
    groups[t] = grouped_items

  return groups

def format_groups(grouped_items, search_keys, header_level=4):
  """Returns Markdown formatted string from Terraform resources, grouped by type,
      in order of search_keys
  """
  output_str = ""
  contents = ""
  for group, items in grouped_items.iteritems():
    ##TODO: Make this pull all attributes if no search keys present
    attributes = [attr for attr in search_keys if attr in items[0]["attributes"].keys()]
    output_str += "\n\n" + "#" * header_level + " {}\n".format(group)
    for attr in attributes:
      output_str += "{} | ".format(attr)
    output_str += "\n" + "--- | " * len(attributes) + "\n"
    for item in items:
      for attr in attributes:
        output_str += item["attributes"][attr] + " | "
      output_str += "\n"

  return output_str

def main():
  """Terraform state search main function."""
  parser = argparse.ArgumentParser(
    description="Returns ```$ terraform state pull``` resources, " \
    "filtered by attribute search terms and formatted to Github markdown." \
    "\n\nUsage: \n$ chmod +x terraform-state-search.py\n" \
    "$ terraform state pull | terraform-state-search.py attr1 attr2 attr3\n",
    formatter_class=RawTextHelpFormatter)
  parser.add_argument("attribute_keys", type=str, nargs="+",
    help="Resource attribute keys to search for, separated by spaces (at least 1 required).")
  parser.add_argument("--header_level", type=int, default=4,
    help="Determines the number of hashes prefixed before resource group names. (Default=4)")
  args = parser.parse_args()

  keys = args.attribute_keys
  header_level = args.header_level
  in_json = stdin_to_json()

  resources = search_resources(in_json, attr_keys=keys)
  grouped_items = groupby_type(resources)
  formatted = format_groups(grouped_items, keys, header_level)

  print(formatted)


if __name__ == '__main__':
  main()
