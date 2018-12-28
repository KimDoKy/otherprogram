import sys
from cx_Freeze import setup, Executable
import os


os.environ['TCL_LIBRARY'] = "C:\\LOCAL_TO_PYTHON\\Python36-32\\tcl\\tcl8.6"
os.environ['TK_LIBRARY'] = "C:\\LOCAL_TO_PYTHON\\Python36-32\\tcl\\tk8.6"

setup(
        name='Demo',
        version='0.9',
        description='검색 프로그램',
        author='도경',
        executables = [Executable('mbc_evening.py')])
