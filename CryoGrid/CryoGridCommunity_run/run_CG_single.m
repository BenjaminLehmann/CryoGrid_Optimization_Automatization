%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Begin user-modified part %%%%%%%%%%%%%%%%%%%%%%%%%

% clear, close('all'), clc
% tic
%init_format = 'EXCEL'; 
%init_format = 'YAML';
init_format = 'EXCEL3D'; % choose the option corresponding to the parameter file format

result_path = '/Users/maximefadel/Documents/Stage_Edytem/Cryogrid_Tristan/Cryogrid_to_run/CryoGridCommunity_results/';

run_name = 'CG_single'; % name of parameter file (without file extension) AND name of subfolder (in result_path) within which it is located
%run_name = 'CG_EXAMPLE_sensitivity_test'; % name of parameter file (without file extension) AND name of subfolder (in result_path) within which it is located

constant_file = 'CONSTANTS_excel'; %filename of file storing constants

source_path = '/Users/maximefadel/Documents/Stage_Edytem/Cryogrid_Tristan/Cryogrid_to_run/CryoGridCommunity_source';

%%%%%%%%%%%%%%%%%%%%%%%% end user-modified part %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------------
%                             do not change
% -------------------------------------------------------------------------

% add source code path
addpath(genpath(source_path));

%create and load PROVIDER
provider = PROVIDER;
provider = assign_paths(provider, init_format, run_name, result_path, constant_file);
provider = read_const(provider);
provider = read_parameters(provider);

% create RUN_INFO class
 [run_info, provider] = run_model(provider);
% run model
 [run_info, tile] = run_model(run_info);


toc