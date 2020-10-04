# -*- coding: utf-8
import os

from setuptools import find_packages, setup

# allow setup.py to be run from any path
os.chdir(os.path.normpath(os.path.join(os.path.abspath(__file__), os.pardir)))

setup(
    name='test-values-from-python',
    version='0.1.0',
    packages=find_packages(),
    include_package_data=True,
    description="Test nginx_project",
    url='https://github.com/practical-ansible',
    author='Pavel Žák',
    author_email='pavel@zak.global',
    classifiers=[
        'Environment :: Web Environment',
    ],
)
