# Habitat as a Package Manager

## Labs 00 - package manager
This lab will demonstrate how habitat is similar to tools like yum, brew, or chocolatey

### What you will do in this Lab
- Install Go 1.22 & Go 1.21
- Run packages with the hab pkg exec command
- Bin link a package

#### Step 1: Install Go 1.22
EXECUTE ```./step-1.sh```

> Command runs hab pkg install core/go22

#### Step 2: Verify the install
EXECUTE ```./step-2.sh```

#### Step 3: Install Go 1.21
EXECUTE ```./step-3.sh```

> Command runs hab pkg install core/go21

#### Step 4: Verify the install
EXECUTE ```./step-4.sh```

#### Step 5: Bin Link Go 1.22
EXECUTE ```./step-5.sh```

> this command runs ```hab pkg install core/go22 -b```      
> Bin linking adds the selected version into your path

#### Step 6: Verify the bin link
EXECUTE ```./step-6.sh```

#### Step 7: Uninstall
EXECUTE ```./step-7.sh```

> this uninstalls each version of go that we installed as the package
> this command runs:     
> - hab pkg uninstall core/go21
> - hab pkg uninstall core/go22

#### Step 8: Verify packages are uninstalled
EXECUTE ```./step-8.sh```
