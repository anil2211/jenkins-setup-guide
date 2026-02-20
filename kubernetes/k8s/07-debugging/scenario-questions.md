# Scenario-Based Questions

## 1. Pod CrashLoopBackOff
- Check logs
- Check env variables
- Check image
- Check memory/cpu limits

## 2. Service Not Accessible
- Check labels
- Check endpoints
- Check targetPort vs containerPort
- Check readiness probe

## 3. High Traffic / Slow App
- Check HPA
- Check CPU/memory
- Scale deployment
- Check DB bottleneck