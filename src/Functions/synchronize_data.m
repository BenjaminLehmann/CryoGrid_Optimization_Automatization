function [dates1_sync, temp1_sync, dates2_sync, temp2_sync] = synchronize_data(dates1, temp1, dates2, temp2)
% synchronize_timeseries
%   Takes two time series (dates + values) and synchronizes them over
%   their common interval.
%
% INPUTS:
%   - dates1, temp1 : vector of dates and values for the first series
%   - dates2, temp2 : vector of dates and values for the second series
%
% OUTPUTS:
%   - dates1_sync, temp1_sync : first series truncated to the common interval
%   - dates2_sync, temp2_sync : second series truncated to the common interval

    % Determine the common interval
    date_min = max([min(dates1), min(dates2)]);
    date_max = min([max(dates1), max(dates2)]);

    % Filter first series
    idx1 = dates1 >= date_min & dates1 <= date_max;
    dates1_sync = dates1(idx1);
    temp1_sync = temp1(idx1);

    % Filter second series
    idx2 = dates2 >= date_min & dates2 <= date_max;
    dates2_sync = dates2(idx2);
    temp2_sync = temp2(idx2);
end
