# Replace with your project ID, dataset ID, and desired labels (key1:value1,key2:value2)
project_id = "your-project-id"
dataset_id = "your-dataset-id"
labels = {"key1": "value1", "key2": "value2"}

# Import libraries
from googleapiclient.discovery import build

def update_table_labels(project_id, dataset_id, table_id, labels):
  # Discover BigQuery API
  service = build('bigquery', 'v2')

  # Build the request
  request = service.tables().patch(
      projectId=project_id,
      datasetId=dataset_id,
      tableId=table_id,
      body={"labels": labels}
  )

  # Execute the request
  request.execute()
  print(f"Labels added to table: {dataset_id}.{table_id}")

# Get list of tables in the dataset
tables = service.tables().list(projectId=project_id, datasetId=dataset_id).execute()["tables"]

# Update labels for each table
for table in tables:
  update_table_labels(project_id, dataset_id, table["id"], labels.copy())

print(f"Labels update completed for tables in dataset: {dataset_id}")
