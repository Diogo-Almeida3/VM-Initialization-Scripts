# Use pip  when dependency will be used for development (E.g pwntools)
# Use pipx when dependency will be used for the application (E.g impacket)

echo "Updating System"
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y
echo "Ensure wget and gpg installation"
sudo apt install wget gpg -y
echo "Creating python Virtual Environment"
cd ~ && python -m venv ~/python_venv
echo "Unzip RockYou"
sudo gunzip /usr/share/wordlists/rockyou.txt.gz
echo "Install Bloodhound"
sudo apt install bloodhound -y
echo "Install pipx"
sudo apt install pipx -y
echo "Install NetExec"
rm ~/NetExec/ && git clone https://github.com/Pennyw0rth/NetExec.git && cd NetExec && pipx install . -y && cd .. && rm -rf ~/NetExec/
echo "Ensuring smooth crypto operations - Fix OScrypto"
~/python_venv/bin/pip uninstall oscrypto -y && pipx install git+https://github.com/wbond/oscrypto.git && pipx install impacket minikerberos --force && sudo updatedb
echo "Tune Pipx with ensurepath and completions"
pipx ensurepath && pipx completions
echo "Put bloodhound trough pipx"
pipx install bloodhound
echo "Add FoxyProxy and Wappalyzer"
firefox https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
firefox https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/
echo "Install go"
sudo apt install golang-go -y
echo "Install Ghidra Strace Ltrace"
sudo apt install ghidra strace ltrace -y
echo "Install Visual Studio Code"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
echo "Ensure BurpSuite instalation"
sudo apt install burpsuite -y
echo "Install BinUtils"
sudo apt install -y binutils
echo "Install Pwn Tools and Angr"
~/python_venv/bin/pip install --upgrade angr
~/python_venv/bin/pip install --upgrade pwntools
echo "Install Volatility3"
pipx install volatility3
echo "Retrieve Seclists"
rm -rf SecList.zip && wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O seclists.zip && unzip seclists.zip && rm -f seclists.zip && sudo mv SecLists-master /usr/share/wordlists/seclists
