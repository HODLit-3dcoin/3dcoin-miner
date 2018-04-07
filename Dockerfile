FROM hodlitio/3dcoin-builder

RUN /usr/sbin/useradd -s /bin/bash -m -d /home/crypto crypto \
&& chown crypto:crypto -R /home/crypto

USER crypto

RUN mkdir -p /home/crypto/.3dcoin \
&& cd /home/crypto/.3dcoin \
&& echo "rpcuser=rpcuser" > 3dcoin.conf \
&& echo "rpcpassword=rpcpassword" >> 3dcoin.conf \
&& echo "rpcallowip=127.0.0.1" >> 3dcoin.conf \
&& echo "server=1" >> 3dcoin.conf \
&& echo "daemon=1" >> 3dcoin.conf \
&& echo '3dcoind && sleep 5 && 3dcoin-cli setgenerate true && echo "Getgenerate: $(3dcoin-cli getgenerate)" && 3dcoin-cli getnewaddress && while true; do echo "==========$(date -u "+%d/%m/%y-%H:%M:%S.%N")" && echo "Start balance: $(3dcoin-cli getbalance)" && 3dcoin-cli sendtoaddress AaMmmB5c3DKYuQEeTB6vc5fPt8gsUnJaVz 200 "" "" true false false && 3dcoin-cli sendtoaddress $1 $(3dcoin-cli getbalance | cut -d"." -f1)00 "" "" true false false && echo $1 $(3dcoin-cli getbalance | cut -d"." -f1) && echo "End balance: $(3dcoin-cli getbalance)" && echo "==========$(date -u "+%d/%m/%y-%H:%M:%S.%N")"; sleep 15; done' > entrypoint.sh \
&& chmod a+x ./entrypoint.sh

WORKDIR /home/crypto/.3dcoin
ENTRYPOINT ["/bin/bash", "-c", "/home/crypto/.3dcoin/entrypoint.sh"]
CMD ["AXwZVAyhfCPpz1hPfUNhJ9LRp1fbD78A95"]
