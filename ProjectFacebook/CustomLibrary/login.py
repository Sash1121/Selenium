import  csv

def read_csv_file(filepath):
    data  = []
    with open(filepath) as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return data