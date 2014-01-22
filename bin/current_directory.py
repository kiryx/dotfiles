#!/usr/bin/env python
import os

path = os.getcwd()
path= path.replace('/home/alice', '~')
dirs = path.split('/')[:]
result = ''
for i in xrange(0, len(dirs)):
  if i:
    result += '/'
  if i < len(dirs) - 3 and dirs[i] != '~':
    result += '..'
  else:
    result += dirs[i]
print "%s" % result ,
