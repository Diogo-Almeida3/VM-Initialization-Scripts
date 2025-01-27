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
git clone https://github.com/Pennyw0rth/NetExec.git && cd netexec && pipx install . -y
echo "Ensuring smooth crypto operations - Fix OScrypto"
pip uninstall oscrypto -y && pipx install git+https://github.com/wbond/oscrypto.git && pipx install impacket minikerberos --force && sudo updatedb
echo "Tune Impacket with MSADA_GUIDS - Used to interact with identified AD objects"
wget https://raw.githubusercontent.com/byt3bl33d3r/CrackMapExec/master/cme/helpers/msada_guids.py && chmod +x msada_guids.py && cp msada_guids.py /home/kali/.local/share/pipx/venvs/impacket/bin/ && cp msada_guids.py /home/kali/.local/share/pipx/venvs/impacket/lib/python3.11/site-packages/impacket/ && sudo cp msada_guids.py /usr/lib/python3/dist-packages/impacket/ && sudo cp msada_guids.py /usr/lib/python3/dist-packages/scapy/layers/
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
