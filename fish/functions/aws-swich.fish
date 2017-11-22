function aws-switch
  set profile "$argv[1]"
  set clientKey "$profile"_AWS_CLIENT_KEY_ID
  set secretKey "$profile"_AWS_SECRET_ACCESS_KEY
  set regionKey "$profile"_AWS_DEFAULT_REGION
  set -gx AWS_SECRET_ACCESS_KEY $$secretKey
  set -gx AWS_CLIENT_KEY_ID $$clientKey
  set -gx AWS_DEFAULT_REGION $$regionKey
end


