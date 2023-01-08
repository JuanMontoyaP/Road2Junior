import pathlib
import argparse
import shutil

parser=argparse.ArgumentParser(
    prog="Copy files to a directory",
    description='''This script copy files of a source directory into a destiny directory. ''',
)

parser.add_argument('path_source', type=pathlib.Path, help='Path of folder where the files are')
parser.add_argument('path_destination', type=pathlib.Path, help='Path of folder where the files will be copied to')
args=parser.parse_args()

shutil.copytree(args.path_source, args.path_destination)