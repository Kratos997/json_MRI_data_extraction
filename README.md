# JSON MRI data file extractor

## Purpose :

This extractor enables the user to extract all the fields contained in a JSON file with the ".json" extension in a CSV (.csv) file (or any other format such as excel (.xlxs)) according to every subject name or ID provided by the user. 

You will also find in the results folder created by the script, a matlab output structure file (.mat) containing as fields the subject name or ID with each individual field containing subfields depending on the data varaiables (Magnetic Field, Echo Time, etc.) found inside the subject's json file. 

This enables the user to directly select and extract the data needed and easy to use in a common data format that can be used by other programming languages and/or softwares such as Python or R for further analysis.


## Use :

You will need to have all your JSON files (.json) into a single directory or folder, ideally with the filename being the subject name or ID. 
Each .json file needs to contain a set of Keys or Variables with their corresponding Values as follows : 

https://docs.fileformat.com/web/json/#json-format-example

You can then download the script in this folder by using the command : 

```git clone https://git@github.com:Kratos997/json_MRI_data_extractuion.git```

## Results : 

The outputs are the following :
- Data directory containg all your .json files 
- scripts directory containing the script to extract your json MRI data
- results directory containing the matlab structure which contains the json file pairs as fields for each individual subject as well as the CSV (.csv) file which has for columns the selected MRI data variables by the user (as described in the script) and as rows the subject name or ID for each subject
