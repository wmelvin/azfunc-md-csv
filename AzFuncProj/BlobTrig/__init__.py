import logging
import tempfile

import azure.functions as func

from pathlib import Path

from csv_to_md import csv_to_md


def main(myblob: func.InputStream):
    logging.info(f"Python blob trigger function processed blob \n"
                 f"Name: {myblob.name}\n"
                 f"Blob Size: {myblob.length} bytes")
    
    #  Only process CSV files.
    if not myblob.name.lower().endswith(".csv"):
        return
    
    #  Copy blob to temp file.
    with tempfile.TemporaryDirectory() as tmpdir_name:
        csv_path = Path(tmpdir_name) / "temp.csv"
        out_path = Path(tmpdir_name) / "temp.md"
        
        #  TODO: Copy blob to temp.csv file.

        #  Just make a little test CSV file for now.
        csv_path.write_text('"A","B","C"\n1,2,3')

        csv_to_md.csv_to_md(str(csv_path), out_path, do_info=True, do_source=True)

        #  TODO: Copy temp.md file to blob.
