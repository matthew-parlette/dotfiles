import i3ipc
from subprocess import Popen


def leaves():
    i3 = i3ipc.Connection()
    tree = i3.get_tree()
    return tree.leaves()


def debug():
    print("Containers")
    for leaf in leaves():
        print("---------------------")
        print("{}: {}".format('Workspace', leaf.workspace().name))
        print("{}: {}".format('Name', leaf.name))
        print("{}: {}".format('Type', leaf.type))
        # print("{}: {}".format('Title', leaf.title))
        print("{}: {}".format('Class', leaf.window_class))
        # print("{}: {}".format('Instance', leaf.instance))
        print(str(leaf.__dict__))
        print("---------------------\n\n")


def workspace_contains(workspace, name=None, wclass=None):
    if name is wclass is None:
        return False
    else:
        for leaf in leaves():
            if leaf.workspace().name == workspace:
                if name and name in leaf.name:
                    return True
                if wclass and wclass in leaf.window_class:
                    return True
    return False


def start(cmd, workspace=None, timeout=10):
    if workspace:
        focus(workspace=workspace)

    Popen(cmd)


def focus(workspace=None):
    if workspace:
        i3 = i3ipc.Connection()
        i3.command("Workspace {}".format(workspace))
