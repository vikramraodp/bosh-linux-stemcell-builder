#!/usr/bin/env bash

set -e

base_dir=$(readlink -nf $(dirname $0)/../..)
source $base_dir/lib/prelude_apply.bash

echo "acpiphp" >> $chroot/etc/modules

if [ "${stemcell_operating_system}" == "opensuse" ] || [ "${stemcell_operating_system}" == "sles" ]; then
  cat > ${chroot}/etc/dracut.conf.d/xen.conf <<EOF
add_drivers+="ata_piix ata_generic xen_vnif xen_vbd xen_platform_pci virtio_blk virtio_scsi virtio_net virtio_pci virtio_ring virtio"
EOF
  kernelver=$( ls -rt $chroot/lib/modules | tail -1 )
  run_in_chroot $chroot "dracut --force --kver ${kernelver}"
fi
