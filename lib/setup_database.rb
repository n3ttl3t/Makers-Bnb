require './lib/user'
require './lib/space'

DataMapper.setup(
 :default, 'postgres://guvddchzusjdnt:a70cc54d6b39467e562aad493738559d0995e6b5fd9ad00a1bbaa287acc0e22f@ec2-79-125-126-205.eu-west-1.compute.amazonaws.com:5432/d7qsnrv1n2pqmo'
)

DataMapper.finalize
DataMapper.auto_upgrade!
