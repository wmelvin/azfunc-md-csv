# BlobTrig

Configured to work with the [flask-fileup-az](https://github.com/wmelvin/flask-fileup-az) project, which can be used to upload files to Azure Storage blobs.

Uses a copy of [csv_to_md.py](https://github.com/wmelvin/fewtilities/blob/main/csv_to_md.py) (as a package) to create a Markdown table from an uploaded CSV file.

Blob in path: `fileup/{name}.csv`

Blob out path: `output-md/{name}.md`
