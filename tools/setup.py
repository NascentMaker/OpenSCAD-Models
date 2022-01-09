#!/usr/bin/env python

from setuptools import find_packages
from setuptools import setup

PROJECT = 'scadtools'
VERSION = '0.1.0'

try:
    long_description = open('README.rst', 'rt').read()
except IOError:
    long_description = ''

setup(
    name=PROJECT,
    version=VERSION,

    description='Tools for OpenSCAD',
    long_description=long_description,

    author='NascentMaker',
    author_email='hello@nascentmaker.com',

    url='https://github.com/NascentMaker/OpenSCAD-Models',
    download_url='https://github.com/NascentMaker/OpenSCAD-Models/tarball/master',

    classifiers=[
        'Development Status :: 3 - Alpha',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3 :: Only',
        'Intended Audience :: Developers',
        'Environment :: Console',
    ],

    platforms=['Any'],

    scripts=[],

    provides=[],
    install_requires=['cliff'],

    namespace_packages=[],
    packages=find_packages(),
    include_package_data=True,

    entry_points={
        'console_scripts': [
            'scadtools = scadtools.main:main'
        ],
        'cliff.scadtools': [
            'inline = scadtools.inline:Inline',
        ],
    },

    zip_safe=False,
)
