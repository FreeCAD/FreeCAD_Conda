import sys, fileinput

path = sys.argv[1]

with fileinput.FileInput(path, inplace=True) as file:
    for line in file:
        line = line.replace("\\", "/")
        line = line.replace("\L", "/L")
        print(line, end="")