import zipfile
import os

import argparse

def un_zip(from_file_name, to_file_dir):
  """unzip zip file"""
  zip_file = zipfile.ZipFile(from_file_name)
  if os.path.isdir(to_file_dir):
    pass
  else:
    os.mkdir(to_file_dir)

  for names in zip_file.namelist():
    zip_file.extract(to_file_dir)

  zip_file.close()


def parse_args(check=True):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output_dir', type=str, required=True)
    parser.add_argument('--dataset_dir', type=str, required=True)
    FLAGS, unparsed = parser.parse_known_args()
    return FLAGS, unparsed

if __name__ == "__main__":
  print('current working dir [{0}]'.format(os.getcwd()))
  w_d = os.path.dirname(os.path.abspath(__file__))
  print('change wording dir to [{0}]'.format(w_d))
  os.chdir(w_d)

  FLAGS, unparsed = parse_args()
  DIR_TO_TEST_DATA = os.path.join(FLAGS.output_dir, 'test_data/')
  PATH_TO_TEST_ZIP = os.path.join(FLAGS.dataset_dir, 'test.zip')

  un_zip(PATH_TO_TEST_ZIP, DIR_TO_TEST_DATA)

