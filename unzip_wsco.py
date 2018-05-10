import zipfile
import os

def un_zip(from_file_name, to_file_dir):
  """unzip zip file"""
  zip_file = zipfile.ZipFile(from_file_name)
  for names in zip_file.namelist():
    zip_file.extract(to_file_dir)

  zip_file.close()

if __name__ == "__main__":
  print('current working dir [{0}]'.format(os.getcwd()))
  w_d = os.path.dirname(os.path.abspath(__file__))
  print('change wording dir to [{0}]'.format(w_d))
  os.chdir(w_d)

  un_zip('/data/HataFeng/data-im2txt/test.zip', 'output/')

