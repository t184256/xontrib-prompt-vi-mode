from setuptools import setup

setup(
    name='xontrib-prompt-vi-mode',
    version='0.1.3',
    url='https://github.com/t184256/xontrib-prompt-vi-mode',
    license='MIT',
    author='Alexander Sosedkin',
    author_email='monk@unboiled.info',
    description='vi-mode status formatter for xonsh prompt',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
)
