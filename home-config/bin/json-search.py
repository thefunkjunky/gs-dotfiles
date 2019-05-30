#!/usr/bin/env python

"""
Command-line tool to search json input (piped from stdin) for keys, and
returns found items grouped together under a shared node
"""

import sys
import json
import re
import argparse

def stdin_to_json():
  """Compiles piped stdin into a json object"""
  return json.load(sys.stdin)

def search_json(in_json, keys, found_items=[], current_item={}):
  """Recursively search json and return [items{keys},..] found under same parent node"""

  if isinstance(in_json, dict):
    if any([search_key in in_json for search_key in keys]):
      item = {}
      found_keys = [search_key for search_key in keys if search_key in in_json]
      for found_key in found_keys:
        item[found_key] = in_json[found_key]
      found_items.append(item)
    for key, value in in_json.iteritems():
      if isinstance(value, (dict, list)):
        search_json(
            value,
            keys,
            found_items)
  elif isinstance(in_json, list):
    for value in in_json:
      search_json(
          value,
          keys,
          found_items)

  return found_items

def format_items(found_items):
  """Returns string formatted from list of found items"""
  output_str = ""
  counter = 0
  for item in found_items:
    counter += 1
    output_str += "\n\nItem " + str(counter) + ":\n"
    contents = ""
    keys = []
    for key in item:
      keys.append(key)
      spaces_len = len(str(item[key])) - len(str(key))
      contents += str(key) + " " * spaces_len + " | "
    output_str += contents + "\n" + "-" * len(contents) + "\n"
    for key in keys:
      output_str += item[key] + " | "

  # Trim the pipes at end-of-lines
  pattern = r"(\| )$"
  regex = re.compile(pattern, re.MULTILINE)
  output_str = re.sub(regex, "", output_str)

  return output_str

def main():
  """CLI JSON search main function"""
  parser = argparse.ArgumentParser(
    description="Scans JSON for searched keys found under the same parent"
    )
  parser.add_argument("keys", type=str, nargs="+",
    help="Keys to search for, separated by spaces")
  args = parser.parse_args()

  keys = args.keys
  in_json = stdin_to_json()

  found_items = search_json(in_json, keys)
  formatted_items = format_items(found_items)

  print(formatted_items)

if __name__ == '__main__':
  main()
