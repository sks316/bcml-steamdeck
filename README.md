![BCML](https://raw.githubusercontent.com/sks316/bcml-steamdeck/main/bcml.png)
# BCML Installer for Steam Deck
BCML can be difficult to get running on Steam Deck, because it uses an immutable filesystem and the version of Python installed by default is higher than what BCML supports. So I made a script to help people install it.

Requires Miniconda with Python 3.7.

# The obligatory explanation of why the script exists and what it does

The version of Python on the Steam Deck is 3.10. This makes BCML incompatible, as it only works on lower versions. The Steam Deck uses an immutable filesystem, which basically means that packages installed on the OS level cannot be modified, hence why the Discover store uses Flatpak, which installs programs to your home directory. Under normal circumstances, this would mean that we can't install older versions of Python and, as such, BCML. Luckily, a neat project called Miniconda exists.

Miniconda creates a totally isolated installation of Python in your home directory, which is one of the few directories that can be modified on an immutable filesystem like Steam Deck uses. This makes it perfect for this purpose. But Miniconda isn't the most user-friendly, especially if you're not a developer. So I saw it fit to automate everything you need to use Miniconda for. That's what this script does. The only thing I couldn't automate was the installation of Miniconda itself, so I direct the user to do that.

First, the script checks if Miniconda exists on the system. If Miniconda doesn't exist on the system, the script shows a pop-up and a message in the terminal asking the user to install Miniconda. Then, the script closes.

If Miniconda does exist on the system, the script shows a pop-up and a message in the terminal telling the user that installation is beginning.

It runs `conda init`, which finishes setup of conda and adds it to your $PATH. This makes it easier to run Python commands within your Miniconda installation in the future.

It then directs Miniconda to install gcc and pip. gcc is required to install BCML, if it's not present then installation will almost-certainly fail. pip is the installer for Python packages, it's what we use to install BCML itself.

It then directs pip to install BCML. This is the most lengthy part of the installation.

After that, it makes a new hidden directory to store the icon for the desktop in. It then downloads the icon and the desktop shortcut, and stores them in the correct places.

Once this is all done, it displays one more terminal message and pop-up stating that installation is finished.
