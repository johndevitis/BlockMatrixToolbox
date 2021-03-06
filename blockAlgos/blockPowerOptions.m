function res = blockPowerOptions(varargin)
%BLOCKPOWEROPTIONS  create a structure for block power iteration options
%
%   RES = blockPowerOptions();
%   create a structure with default values
%
%   RES = blockPowerOptions(PNAME, PVALUE);
%   create a structure by specifying parameter name-value pairs. Available
%   options are:
%   * maxIterNumber     the maximal number of iterations (default 10)
%   * residTol          the absolute tolerance on residual between two
%                       successive iterations (default 1e-8)
%   * eigenTol          the absolute tolerance on eigen value between two
%                       successive iterations (default 1e-8)
%
%
%   Example
%     opts = blockPowerOptions('maxIterNumber', 20, 'residTol', 1e-12);
%     algo = JacobiBlockPower(....);
%     res = algo.solve(U0, opts);
%
%   See also
%
 
% ------
% Author: David Legland
% e-mail: david.legland@nantes.inra.fr
% Created: 2016-03-04,    using Matlab 8.6.0.267246 (R2015b)
% Copyright 2016 INRA - Cepia Software Platform.

res = struct(...
    'maxIterNumber', 100, ...
    'residTol', 1e-8, ...
    'eigenTol', 1e-8);

while length(varargin) > 1
    name = varargin{1};
    switch lower(name)
        case 'maxiternumber'
            res.maxIterNumber = varargin{2};
        case 'residtol'
            res.residTol = varargin{2};
        case 'eigentol'
            res.eigenTol = varargin{2};
        otherwise
            error(['Unknown parameter: ' name]);
    end
end
