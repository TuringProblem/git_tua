# @author { @Override } | 1/9/2025 : 0133

def getUsr(): #{
    name: str = str(input("Enter your Github Profile: "))
    return name;
#}

github = getUsr();

def gitTua(f,a):
    return f(a);

def gitBlank(str: str) -> str:
    return "git {}".format(str);

def branch():
    return 0;

git =  lambda x : gitTua(gitBlank, x);


def commandBox():
    print("┌─────────── Enter Command ───────────┐"); 
    usrInput: str = str(input("| ")) 



commands = {
        'cl': git("clone"),
        'b': git("branch"),
        'f': git("fetch"),
        'p': git("pull"),
        'a': git("add"),
        'fa': git("add ."),
        'help': git("-help")
}



print("Testing:\n")

print(commands['b'])
print(commands['f'])
print(commands['p'])
print(commands['a'])
print(commands['fa'])
print(commands['help'])
print(commands['cl'])
commandBox()
