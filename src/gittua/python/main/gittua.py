# @author { @Override } | 1/9/2025 : 0133
ANSI = {

}

def getUsr():
    name = input("Enter your Github Profile: ")
    return name
github = getUsr()


def gitTua(f,a):
    return f(a)

def gitBlank(str):
    return "git {}".format(str)

def branch():
    return 0
    

def handler(key):
    match key:
        case "cl":
            command = gitTua(gitBlank, "clone")
            print(f"We worked :) see {command}")
            return command
        case _:
            return 0

    

commands = {
        'cl': handler("cl"),
        'b': handler("b")
}

print("Hello")
print(commands['cl'])
