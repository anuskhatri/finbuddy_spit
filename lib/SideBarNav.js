import { FaUser } from "react-icons/fa";
import { TbLayoutDashboardFilled } from "react-icons/tb";
import { MdOutlineProductionQuantityLimits } from "react-icons/md";
import { GiClothespin } from "react-icons/gi";
import { IoColorPaletteOutline } from "react-icons/io5";
import { TbRulerMeasure } from "react-icons/tb";
import { FaList } from "react-icons/fa";
import { TbTruckDelivery } from "react-icons/tb";

const menu = [
    {
        name: 'Dashboard',
        link: '/',
        icon: FaUser
    },
    {
        name: 'Track Expenses',
        link: '/TrackExp',
        icon: TbLayoutDashboardFilled
    },
    {
        name: 'Manage Budget',
        link: '/Category',
        icon: GiClothespin
    },
    {
        name: 'Savings Goals',
        link: '/size',
        icon: TbRulerMeasure
    },
    {
        name: 'Bill Payment Calendar',
        link: '/color',
        icon: IoColorPaletteOutline
    },
    {
        name: 'Wellness Score',
        link: '/product',
        icon: MdOutlineProductionQuantityLimits
    },
  
];

export default menu;
