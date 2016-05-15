import os
import shutil
import re
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from zipfile import ZipFile
from io import BytesIO

path = "~/.steam/steam/steamapps/common/Sid Meier's Civilization V/steamassets/assets/dlc/"
textpath = "~/.local/share/Aspyr/Sid Meier's Civilization 5/Text"
relpath = 'ui_bc1'
mainlink = 'http://forums.civfanatics.com/downloads.php?do=file&id=21929'


# remove old version of eui if it exists
path = os.path.expanduser(path)
fullpath = os.path.join(path, relpath)
if os.path.exists(fullpath):
    shutil.rmtree(fullpath)

# retrieve download link
# pretty dumb stuff - could probably just directly get it with the mainlink + &act=down
r = requests.get(mainlink)
soup = BeautifulSoup(r.text, "html.parser")
e = soup.find('img', {'src': 'http://www.civfanatics.com/images/download1.gif'})
link = e.parent['href']
link = urljoin(mainlink, link)
print("download link:", link)

# download zip
textpath = os.path.expanduser(textpath)
z = ZipFile(BytesIO(requests.get(link).content))
for file in z.namelist():

    if file.lower().startswith(relpath + os.sep):
        destpath = path
    elif file != 'Readme.txt':
        destpath = textpath
    else:
        continue

    data = z.read(file)
    destfile = os.path.join(destpath, file.lower())

    dirToCreate = destfile
    if not file.endswith(os.sep):
        dirToCreate = os.path.dirname(destfile)

    if not os.path.exists(dirToCreate):
        os.makedirs(os.path.dirname(destfile))

    if not file.endswith(os.sep):
        with open(destfile, 'wb') as f:
            f.write(data)
