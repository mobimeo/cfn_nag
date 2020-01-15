FROM stelligent/cfn_nag:latest

COPY  cfn_nag_ignore.yaml /srv/

ENTRYPOINT ["cfn_nag", "--blacklist-path", "/srv/cfn_nag_ignore.yaml"]
