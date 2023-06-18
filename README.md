# JSON MRI data file extractor

## Purpose :

This extractor enables the user to extract all the fields contained in a JSON file with the ".json" extension in a CSV (.csv) file (or any other format such as excel (.xlxs)) according to every subject name or ID or per MRI acquisition sequence. The JSON files contain MRI acquisition parameters for a given sequence (structural T1 MRI, resting state functional MRI, task-based functional MRI, Diffusion Tensor Imaging, etc.) such as the Magnetic Field Strength, the Echo Time (TE), the Repetion Time (TR), the Flip Angle (FA), etc.

There are two main scripts depending on your programming language of choice : Matlab and Python Jupyter Notebook. 

You will also find in the results folder created by the matlab script, a matlab output structure file (.mat) containing as fields the subject name or ID with each individual field containing subfields depending on the data varaiables (Magnetic Field, Echo Time, etc.) found inside the subject's json file. The outputs from the Jupyter Notebook are CSV files containing the MRI parameters for each subject (ID1, ID2, ID3, etc.) or per sequence (T1, BOLD, DTI, etc.). In the latter, the values corresponding to the sequences are the unique values found for each subject, where we would expect them to be identical for a same acquisition sequence.

This enables the user to directly select and extract the data needed and easy to use in a common data format that can be used by other programming languages and/or softwares such as Python or R for further analysis or directly perfom any subsequent analysis in the jupyter notebook provided.


## Use :

You will need to have all your JSON files (.json) into a single directory or folder, ideally with the filename being the subject name or ID and containing the sequence used (for T1 use mp2rage or other, and for resting-state use rest or other as you prefer). 
Each .json file needs to contain a set of Keys or Variables with their corresponding Values as follows : 

https://docs.fileformat.com/web/json/#json-format-example

You can then download the script in this folder by using the command : 

```bash 
git clone https://git@github.com:Kratos997/json_MRI_data_extraction.git
```

## Results : 

The outputs are the following :
- Data directory containg all your .json files 
- results directory containing the matlab structure which contains the json file pairs as fields for each individual subject as well as the CSV (.csv) file which has for columns the selected MRI data variables by the user (as described in the script) and as rows the subject name or ID for each subject
- The MRI acquistion parameters (columns) selected for extraction for each subject or depending on the MRI sequence used (DTI, T1, T2, rs-fMRI, etc.)
