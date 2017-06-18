# based on the permission_required decorator, from django.contrib.auth
from django.contrib.auth.decorators import user_passes_test
from django.core.exceptions import PermissionDenied


def group_required(group_name, login_url=None, raise_exception=False):
    """
    Decorator for views that checks whether a user belongs to a particular
    group, redirecting to the log-in page if necessary.
    If the raise_exception parameter is given the PermissionDenied exception
    is raised.
    """
    def check_group(user):
        # First check if the user belongs to the group
        if user.groups.filter(name=group_name).exists():
            return True
        # In case the 403 handler should be called raise the exception
        if raise_exception:
            raise PermissionDenied
        # As the last resort, show the login form
        return False
    return user_passes_test(check_group, login_url=login_url)