# Prefetcharr

Automatically have Sonarr fetch the next episodes of the show you're watching on Jellyfin, Emby, or Plex.

Prefetcharr periodically polls your media server for active playback sessions. When you're nearing the end of available episodes, it instructs Sonarr to search for and download the next ones — so they're ready when you get there.

## Configuration

| Option | Description | Default |
|---|---|---|
| `media_server_type` | `jellyfin`, `emby`, or `plex` | `jellyfin` |
| `media_server_url` | Base URL of your media server | `http://homeassistant.local:8096` |
| `media_server_api_key` | API key for your media server | _(required)_ |
| `sonarr_url` | Base URL of your Sonarr instance | `http://homeassistant.local:8989` |
| `sonarr_api_key` | API key for Sonarr | _(required)_ |
| `interval` | Polling interval in seconds | `900` |
| `prefetch_num` | Number of episodes to keep available ahead | `2` |
| `request_seasons` | Prefer fetching full seasons (season packs) | `true` |
| `log_level` | Log verbosity: `Trace`, `Debug`, `Info`, `Warn`, `Error` | `Info` |
| `users` | Comma-separated list of usernames/IDs to monitor (optional) | |
| `libraries` | Comma-separated list of library names to monitor (optional) | |

## Getting your API keys

**Jellyfin:** Administration → Dashboard → Advanced → API Keys

**Emby:** Administration → Dashboard → Advanced → API Keys

**Plex:** Extract your server token from a Plex config file — see the [Plex support article](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/).

**Sonarr:** Settings → General → Security → API Key

## More info

- [Prefetcharr on GitHub](https://github.com/p-hueber/prefetcharr)
