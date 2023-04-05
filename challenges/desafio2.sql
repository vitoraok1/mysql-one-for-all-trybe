SELECT 
    COUNT(DISTINCT songs.song_id) AS cancoes,
    COUNT(DISTINCT artists.artist_id) AS artistas,
    COUNT(DISTINCT albums.album_id) AS albuns
FROM
    SpotifyClone.songs AS songs,
    SpotifyClone.artists AS artists,
    SpotifyClone.albums AS albums;