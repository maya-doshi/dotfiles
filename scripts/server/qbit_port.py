# Port to update qbittorrent listen_port based on file (from gluetun)
import time
import qbittorrentapi

port_path = "<path>"
loop = 15 * 60

conn_info = dict(
    host     = "<host>",
    username = "<user>",
    password = "<pass>",
)

while (True):
    cur_port = open(f"{port_path}", "r")
    cur_port = cur_port.read()
    cur_port = cur_port.replace("\n", "")

    print(f"File {cur_port}")
    qbt_client = qbittorrentapi.Client(**conn_info)
    try:
        qbt_client.auth_log_in()
        print(f"qbit {qbt_client.application.preferences.listen_port}")
        if (f"{cur_port}" != f"{qbt_client.application.preferences.listen_port}"):
            prefs = qbt_client.application.preferences
            prefs["listen_port"] = cur_port
            qbt_client.app.preferences = prefs
    except qbittorrentapi.LoginFailed as e:
        print(e)

    time.sleep(loop)
