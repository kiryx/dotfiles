#!/usr/bin/env python
import os
import getpass
username = getpass.getuser()

path = os.getcwd()
path = path.replace('/home/{}'.format(username), '~')
dirs = path.split('/')[:]
result = ''
for i in xrange(0, len(dirs)):
    if i:
        result += '/'
    if i < len(dirs) - 3 and dirs[i] != '~':
        result += '..'
    else:
        result += dirs[i]
print "%s" % result,
