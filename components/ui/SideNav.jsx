"use client"
import React, { useEffect } from 'react'
import sideNav from '../../lib/SideBarNav'
import SideNavCard from '../SideNavCard'
const SideNav = () => {
    useEffect(() => {
        console.log(sideNav);
        
    })
    return (
        <div>
            <div className='w-[30vh] min-h-[100vh] bg-[#d9d9d9] '>
                <div className='  p-4'>
                    <div className='text-2xl text-center'>
                        Rehan Ansari 
                    </div>
                    <div className='w-full my-3 h-[1px] bg-black'></div>
                    <SideNavCard data={sideNav} />
                </div>

            </div>
        </div>
    )
}

export default SideNav
