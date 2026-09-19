.PHONY: ghaw-gql-control ghaw-gql-differential

ghaw-gql-control:
	@gh api graphql -f 'query={repository(owner:$$owner,name:$$name){object(expression:$$expr){...on Blob{text}}}}' -f owner=masonhck357 -f name=ghaw-gh-proxy-private-b-20260918 -f expr=HEAD:proof/graphql-private-canary.txt --jq '.data.repository.object.text == "GHAW_GQL_PRIVATE_CANARY_20260918_F4C90A6B"'

ghaw-gql-differential:
	@gh api graphql -f 'query={__schema{queryType{name}} repository(owner:$$owner,name:$$name){object(expression:$$expr){...on Blob{text}}}}' -f owner=masonhck357 -f name=ghaw-gh-proxy-private-b-20260918 -f expr=HEAD:proof/graphql-private-canary.txt --jq '.data.repository.object.text == "GHAW_GQL_PRIVATE_CANARY_20260918_F4C90A6B"'
