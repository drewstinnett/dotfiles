#!/usr/bin/env python3
import sys
import argparse
import logging


def parse_args():
    """Parse the arguments."""
    parser = argparse.ArgumentParser(
        description="This is my super sweet script")
    parser.add_argument("-v",
                        "--verbose",
                        help="Be verbose",
                        action="store_true",
                        dest="verbose")

    return parser.parse_args()


def main():
    args = parse_args()
    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)
    @CURSOR@
    return 0


if __name__ == "__main__":
    sys.exit(main())
