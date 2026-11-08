# E7 P1-9 RTC interval evidence

Status: **PARTIAL**. The original two-run acceptance passes for k=1 and k=12 using
identical images. The P1 three-run k=12 repeat requirement has only 2 of 3 matching
q16=6929 full-printf runs in the available evidence.

## Scope and method

Evidence is from WSL Ubuntu-22.04, /home/ysyx/ysyx-workbench. This report reads
existing results only and launched no simulator. Full printf is confirmed by the
rtc-full-printf-insert-arg build target, format probe, and 11 full RTC date lines.
Statistics are recomputed from each original monotonic timestamp JSON with
measure_host.py::summarize_intervals.

Acceptance remains per-run 10-interval mean within 0.95–1.05 seconds and guest
RTC_DIAG max_late_us < 1000000. There is no per-interval pass threshold.

## Passing q16=6929 k=12 runs

Image SHA-256: 5c8b1f4c0e4ca6200168defd941d11bc751cae17d87056f93ca3f75f80242eec.

- rtc-wall-q6929-trial2-k12: mean=0.967607498s, min=0.837328s, max=1.032615s, population stddev=0.050260s, late=137474us; intervals=[1.015246, 0.997903, 0.837328, 0.960823, 0.980666, 0.965051, 1.032615, 0.945748, 0.961443, 0.979253]
- rtc-wall-q6929-trial3-k12: mean=0.994095856s, min=0.864183s, max=1.028495s, population stddev=0.044907s, late=137474us; intervals=[0.986937, 1.003882, 0.864183, 1.014868, 1.028495, 1.021844, 0.991176, 1.009711, 1.011283, 1.008581]

These two runs pass the preserved mean and lateness criteria. The individual
minimums are descriptive only.

## Causal observations

- The cache-phase q16=8000 run averaged 0.866182s. Applying the recorded calibration
  update round(q16 * mean) gives 6929, which then measured 0.967607s and 0.994096s.
- A separate older same-image q16=8000 full-printf series had host means
  1.118490s, 1.116311s, 1.108064s, 1.128928s, 2.466562s, 2.749636s, while its guest maximum lateness stayed [767836]us.
  This separates host-observed output cadence from guest deadline lateness and shows
  strong sensitivity to simulator/host throughput or scheduling.
- RTC_DIAG contains only the maximum over the full guest run, with no interval index.
  These logs cannot map the slowest host interval to a guest deadline event; exact
  per-interval causal attribution would need guest per-tick telemetry.

## Evidence files

- stage.json: original project verifier result for two runs at k=1 and k=12.
- analysis.json: every identified full-printf k=12 run, raw interval observations,
  recomputed stats, same-Q/image groups, environment and diagnostic limits.
- source-manifest.json: SHA-256 of the updated measurement/calibration scripts and
  relevant guest/verifier source.

The k=1 two-run result uses q16=20100 with SHA-256
5d1d361862c44b77800ac82654f859e244f19dfadd321a7bc4b29bc2e0b2ae6e;
its means are 0.972451s and 0.964571s, and guest maximum lateness is 44872us.
