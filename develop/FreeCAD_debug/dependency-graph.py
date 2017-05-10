import json
import glob
from os.path import join, basename
# install this with "conda install -c conda-forge python-graphviz"
import graphviz as gv
# path to your conda environment
path = '/home/lo/conda/envs/fc_graph'
dg = gv.Digraph(filename='env-%s' % basename(path), format='svg')
version_dict = {}
for json_file in glob.glob(join(path, 'conda-meta', '*.json')):
    j = json.load(open(json_file))
    version_dict[j["name"]] = j["name"] + "_" + j["version"]
for json_file in glob.glob(join(path, 'conda-meta', '*.json')):
    j = json.load(open(json_file))
    dg.node(version_dict[j['name']])
    for dep in j.get('depends', []):
        dg.edge(version_dict[j['name']], version_dict[dep.split(' ')[0]])
dg.render()
