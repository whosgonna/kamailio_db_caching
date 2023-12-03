## Kamailio DB Caching

## Blog Post

Full details can be found [here]([http://kaufmania.wordpress.com)

## Usage
To run this example with Docker, in one shell cd to this directory and run:

```
docker compose up -d && docker compose logs -f proxy
```

In another shell, CD to the same directory, and use `docker compose exec` to
send test messages with SIP from the proxy to itself.

##### Known DIDs:
To test a 'known' DID (it's in the database from the setup files) send the same
INVITE in a short span, less than 15 seconds apart:

```
docker compose exec proxy sipp -m 1 -sn uac -s 15555551000 127.0.0.1
docker compose exec proxy sipp -m 1 -sn uac -s 15555551000 127.0.0.1
```

Look at the first shell (the one with the docker compose logs for the `proxy`
container), and it should look like this:

```
kamailio_db_caching-proxy-1  | 12(18) INFO: <script>: Serialized query result: [id=1;did=15555551000;route_id=101;failure_route_id=1006;description=Alice;]
kamailio_db_caching-proxy-1  | 12(18) NOTICE: <script>: $xavp(did_data=>did) [15555551000]
kamailio_db_caching-proxy-1  | 14(20) INFO: <script>: Cache hit for DID [15555551000]: [id=1;did=15555551000;route_id=101;failure_route_id=1006;description=Alice;]
kamailio_db_caching-proxy-1  | 14(20) NOTICE: <script>: $xavp(did_data=>did) [15555551000]
```


##### Unknown DID:
To test an 'unknown' DID (not in the DB), pass the number `15555551001` to
SIPp (or any other number not in the DB):

```
docker compose exec proxy sipp -m 1 -sn uac -s 15555551001 127.0.0.1
docker compose exec proxy sipp -m 1 -sn uac -s 15555551001 127.0.0.1
```

The results should be like this. Note the 'Cache hit' line, even fo rthe unknown
number:
```
kamailio_db_caching-proxy-1  |  9(15) INFO: <script>: Serialized query result: [did;]
kamailio_db_caching-proxy-1  |  9(15) NOTICE: <script>: $xavp(did_data=>did) []
kamailio_db_caching-proxy-1  | 11(17) INFO: <script>: Cache hit for DID [15555551001]: [did;]
kamailio_db_caching-proxy-1  | 11(17) NOTICE: <script>: $xavp(did_data=>did) []
```

