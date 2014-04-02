#from distutils.core import setup
from setuptools import setup
#import test_hook


setup(
    name='Test Hook',
    #entry_points={
    #    'nova.hooks': {
    #        'create_instance': test_hook.TestHook,
    #    }
    #},
    entry_points="""
    [nova.hooks]
    create_instance=test_hook:TestHook
    """,


    packages=['test_hook']
)
