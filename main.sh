protoc -I /src --python_betterproto_out=lib $*
# Merge python file to module that has the same name
/usr/bin/python3 /usr/bin/merge-python.py lib
