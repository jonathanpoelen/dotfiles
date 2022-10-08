mkdir -p install
cd install

# Luvi building
git clone --recursive https://github.com/luvit/luvi.git
cd luvi
make regular-shared && make && make test
cp build/luvi ../..
cd ..

# Lit building
export CUSTOM_LUVI=../luvi/build/luvi
git clone --recursive https://github.com/luvit/lit.git
cd lit
$CUSTOM_LUVI . -- make . ./lit $CUSTOM_LUVI
cp lit ../..

# Luvit building
./lit make github://luvit/luvit ./luvit $CUSTOM_LUVI
cp luvit ../..
cd ../..
