"""
Module for setting up the project.
"""

from setuptools import find_packages, setup

setup(
    name="hailstone_calculator",
    version="0.1.0",
    packages=find_packages(exclude=["tests*"]),
    license="MIT",
    description="Hailstone calculator",
    author="Ibrahim Animashaun",
)
