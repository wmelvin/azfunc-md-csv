import logging
import tempfile

import azure.functions as func

from pathlib import Path

from csv_to_md import csv_to_md


def main(inblob: func.InputStream, outblob: func.Out[str]):
    logging.info(f"Blob trigger on '{inblob.name}'")

    if not inblob.name.lower().endswith(".csv"):
        logging.info("Not a CSV file.")
        return

    with tempfile.TemporaryDirectory() as tmpdir_name:
        csv_path = Path(tmpdir_name) / "temp.csv"
        out_path = Path(tmpdir_name) / "temp.md"

        logging.info(f"Write blob data to temp file '{csv_path}'")
        with open(csv_path, "wb") as f:
            f.write(inblob.read())

        logging.info("Call csv_to_md.")
        csv_to_md.csv_to_md(
            str(csv_path),
            str(out_path),
            do_info=False,
            do_source=False
        )

        logging.info(f"Write '{out_path}' to blob output.")
        md = out_path.read_text()
        outblob.set(md)
