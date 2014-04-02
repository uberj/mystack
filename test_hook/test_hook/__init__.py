class TestHook(object):
    def pre(self, *args, **kwargs):
        with open('/tmp/hook_pre', 'w+') as fd:
            fd.write("In user hook: {0} {1}".format(args, kwargs))

    def post(self, rv, *args, **kwargs):
        with open('/tmp/hook_post', 'w+') as fd:
            fd.write("In user hook: {0} {1}".format(args, kwargs))
