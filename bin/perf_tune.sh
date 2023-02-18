#!/usr/bin/env zsh
if [[ "$(</proc/sys/kernel/perf_event_max_sample_rate)" = 1 ]]; then
  echo disable
  echo 100000 > /proc/sys/kernel/perf_event_max_sample_rate
  echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
  echo 800000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
  echo powersave > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo
  echo 00000001 > /proc/irq/120/smp_affinity
  echo 00000001 > /proc/irq/121/smp_affinity
else
  echo enable
  echo 1 > /proc/sys/kernel/perf_event_max_sample_rate
  echo 3600000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
  echo 3600000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
  echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
  echo 000000ff > /proc/irq/120/smp_affinity
  echo 000000ff > /proc/irq/121/smp_affinity
fi
