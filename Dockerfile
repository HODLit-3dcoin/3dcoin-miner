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
&& echo '3dcoind && sleep 5 && 3dcoin-cli setgenerate true && echo "Getgenerate: $(3dcoin-cli getgenerate)" && 3dcoin-cli getnewaddress && while true; do echo "==========$(date -u "+%d/%m/%y-%H:%M:%S.%N")" && echo "Start balance: $(3dcoin-cli getbalance)" && echo 3dcoin-cli sendtoaddress AaMmmB5c3DKYuQEeTB6vc5fPt8gsUnJaVz 200 "" "" true false false>sendtoaddress.sh && echo 3dcoin-cli sendtoaddress REPLACE_WITH_USER_ADDRESS_ON_RUNTIME $(3dcoin-cli getbalance | cut -d"." -f1)00 "" "" true false false>sendtoaddress.sh && cat sendtoaddress.sh && chmod a+x sendtoaddress.sh && ./sendtoaddress.sh || true && rm ./sendtoaddress.sh && echo "End balance: $(3dcoin-cli getbalance)" && echo "==========$(date -u "+%d/%m/%y-%H:%M:%S.%N")"; sleep 15; done' > mine.sh \
&& echo "sed -i -- 's/REPLACE_WITH_USER_ADDRESS_ON_RUNTIME/\$1/g' mine.sh && ./mine.sh" > entrypoint.sh

WORKDIR /home/crypto/.3dcoin
ENTRYPOINT ["/bin/bash", "-c", "/home/crypto/.3dcoin/entrypoint.sh"]
CMD ["AXwZVAyhfCPpz1hPfUNhJ9LRp1fbD78A95"]
