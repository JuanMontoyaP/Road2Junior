import os
import glob
import pathlib
import argparse

def rename_files_in_directory(path: str, type_of_file: str, characters_to_remove:int):
    """
    rename_files_in_directory

    Description:
        This function takes a directory path, a file extension and a number of characters to remove from the file names that are
        inside the directory.

    Args:
        path (str): path to directory
        type_of_file (str): file extension
        character_to_remove (int): number of characters to remove

    Returns:
        None
    """

    try:
        os.chdir(path)
    except FileNotFoundError as error:
        print(error)
        exit(1)


    for file in glob.glob("*" + type_of_file):
        file_name = os.path.splitext(file)[0]
        extension = os.path.splitext(file)[1]
        new_file_name = file_name[:-characters_to_remove] + extension
        try:
            os.rename(file, new_file_name)
        except OSError as error:
            print(error)
        else:
            print(f"Renamed {file} to {new_file_name}")

if __name__ == "__main__":
    parser=argparse.ArgumentParser(
        prog="Rename files in directory",
        description='''This script rename files of a given extension in a given directory deleting a specified number of characters in the name. ''',
    )

    parser.add_argument('path', type=pathlib.Path, help='Path of folder where files are to be renamed')
    parser.add_argument('file_type', type=str, help='File type of the files to be renamed')
    parser.add_argument('characters', type=int, help='Number of characters to remove from the name of the files')
    args=parser.parse_args()

    rename_files_in_directory(args.path, args.file_type, args.characters)