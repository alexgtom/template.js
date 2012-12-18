#!/usr/bin/python

import argparse
import sys
import subprocess

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("testname", help="the name of the test")
    args = parser.parse_args()

    correct_ast_file = open(args.testname + ".ast")
    expected_output = correct_ast_file.read()
    correct_ast_str = " ".join(expected_output.strip().split())
    correct_ast_file.close()
    
    proc = subprocess.Popen(['../../template_parse.py', '--ast', args.testname + '.html.te'], stdout=subprocess.PIPE)
    got_output = proc.stdout.read()
    subject_ast_str = " ".join(got_output.strip().split())

    if correct_ast_str != subject_ast_str:
        print "---------------------------------------------------------------"
        print "ast was incorrect. Expected: "
        print "---------------------------------------------------------------"
        print expected_output
        print "---------------------------------------------------------------"
        print "Got: "
        print "---------------------------------------------------------------"
        print got_output
        sys.exit(1)


if __name__ == "__main__":
    main()
